from transformers import PreTrainedTokenizerFast, AutoTokenizer, AutoModelWithLMHead, GPT2LMHeadModel
from transformers import DistilBertTokenizerFast
from transformers import TFDistilBertForSequenceClassification, TFTrainer, TFTrainingArguments

import torch
import torch.nn as nn
path = "Okeybot_model_with_10000_data.pt"
#model = torch.load(path) 
model = AutoModelWithLMHead.from_pretrained("byeongal/Ko-DialoGPT")
model.load_state_dict(torch.load(path))
#model = AutoModelWithLMHead.from_pretrained("byeongal/Ko-DialoGPT")
tokenizer = PreTrainedTokenizerFast.from_pretrained('byeongal/Ko-DialoGPT')

for step in range(3):
    # encode the new user input, add the eos_token and return a tensor in Pytorch
    new_user_input_ids = tokenizer.encode(input(">> User:") + tokenizer.eos_token, return_tensors='pt')# append the new user input tokens to the chat history
    bot_input_ids = torch.cat([chat_history_ids, new_user_input_ids], dim=-1) if step > 0 else new_user_input_ids# generated a response while limiting the total chat history to 1000 tokens    
    chat_history_ids = model.generate(
    bot_input_ids, max_length=1000,
    pad_token_id=tokenizer.eos_token_id
    )# pretty print last ouput tokens from bot

    print("EmpathicChatbot: {}".format(tokenizer.decode(chat_history_ids[:, bot_input_ids.shape[-1]:][0], skip_special_tokens=True)))