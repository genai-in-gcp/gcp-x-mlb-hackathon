# This repo holds a code for GCP x MLB Hackathon Challenge Solution


Link to Hackathon: https://next2025challenge.devpost.com/

--------------------------------------
# Prerequistes

You must have Node installed on your computer, in order to run this,
Please follow instructions in the provided URL,

`https://nodejs.org/en/download`

Please make sure `node` is in your environment path before running, as it is required in the upload stage.


--------------------------------------
# Installation

1. **Create a virtual environment:**
    ```sh
    python3 -m venv .venv
    ```

2. **Activate the virtual environment:**

    - On macOS and Linux:
        ```sh
        source .venv/bin/activate
        ```
    - On Windows:
        ```sh
        .\.venv\Scripts\activate
        ```

3. **Upgrade `pip`:**
    ```sh
    pip install --upgrade pip
    ```
   - On Windows:   
   ```sh
   python -m pip install --upgrade pip
   ```

4. **Install python dependencies:**
    ```sh
    pip install -r requirements.txt
    ```
   
5. **Install node packages:**
   ```sh
   cd tiktok_uploader/tiktok-signature/
   npm i
   ```

6. **Run locally:**
    ```sh
    streamlit run app.py
    ```
 