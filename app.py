import streamlit as st
from streamlit_player import st_player
from tiktok_uploader import tiktok
from tiktok_uploader.Config import Config

# _ = Config.load("./app/config.txt")

# Embed a youtube video
st_player("https://youtu.be/CmSKVW1v0xM")

if st.button("Upload Video to TikTok"):
    tiktok.login("my_user")
    tiktok.upload_video("my_user", "pre-processed.mp4", "Test video title")