import qrcode
import webbrowser
import pyautogui
import time

def generate_qr_and_send_message(whatsapp_number, message):
    # Generate WhatsApp contact link with the given number
    whatsapp_link = f"https://wa.me/{whatsapp_number}"

    # Generate QR code
    qr = qrcode.QRCode(version=1, error_correction=qrcode.constants.ERROR_CORRECT_L, box_size=10, border=4)
    qr.add_data(whatsapp_link)
    qr.make(fit=True)

    # Create an image from the QR Code instance
    img = qr.make_image(fill_color="black", back_color="white")

    # Save the image
    img_path = "whatsapp_qr.png"
    img.save(img_path)

    # Open WhatsApp in browser
    webbrowser.open(whatsapp_link)
    time.sleep(5)  # wait for WhatsApp to load

    # Simulate typing and sending a message
    pyautogui.typewrite(message)
    pyautogui.press('enter')

# Define the WhatsApp number and message
whatsapp_number = "8528109505"  # replace with the desired WhatsApp number
message = "Hello, this is an automated message."

# Generate QR code and send message
generate_qr_and_send_message(whatsapp_number, message)
