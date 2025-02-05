import streamlit as st
from streamlit_player import st_player
from tiktok_uploader.upload import upload_video, upload_videos
from tiktok_uploader.auth import AuthBackend

# Embed a youtube video
st_player("https://youtu.be/CmSKVW1v0xM")
# upload_video('test_video.mp4',
#              description='this is my description',
#              cookies='tiktok_session.cookie')

if st.button("Upload Video to TikTok"):
    videos = [
        {
            'path': 'test_video.mp4',
            'description': 'Bla bla bla'
        }
    ]
    auth = AuthBackend(username="laguriss",password="xxx")
    upload_videos(videos=videos, auth=auth)
