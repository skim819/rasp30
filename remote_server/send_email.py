# File Name: send_email.py
# Author: Ishan Kumar Lal
# Date Created: June 25th, 2014
# Description:
# - Coded using Python 3.4.1
# - Reads in user email and file name
# - Zips up files to be sent from user's computer
# - Changes the zip file extension for security
# - Attaches file to a new email and send's to FPAA server
# CADSP @ Georgia Institute of Technology. Copyright 2014. All Rights Reserved.

# Import Statements
import zipfile, os, sys
import poplib, getpass, email, smtplib
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart
from email import encoders

# Email Account Details
u = 'fpaabot.dev@gmail.com'
up = 'cadsp_fpaa'

# Process Command Line Arguments
# First argument is file folder name
# Second argument is user's email address
if (len(sys.argv) == 3):
    users_email = str(sys.argv[1])
    file_name = str(sys.argv[2])
    print(users_email)
    print(file_name)
else:
    sys.exit("user email not provided")

zip_name = file_name+'.zip'
# Change zip file extension name ...
new_name = file_name +".cadsp"
os.renames(zip_name, new_name)

# Compose email ...
fromaddr = "fpaabot.dev@gmail.com"
toaddr = "fpaabot.dev@gmail.com"
msg = MIMEMultipart()
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = users_email
body = "Don't need to put anything in here yet"
msg.attach(MIMEText(body, 'plain'))
"""part = MIMEBase('application', "octet-stream")
        part.set_payload( open(new_name,"rb").read() )
        Encoders.encode_base64(part)
        part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(f))
        msg.attach(part)"""
try:
    part = MIMEBase('application', "octet-stream")
    part.set_payload( open(new_name,"rb").read() )
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(new_name))
    msg.attach(part)
    #f = open(new_name, 'rb')
    #print("it worked")
    #img = MIMEImage(f.read())
    #print("img worked")
    #msg.attach(img)
    #f.close()
except:
    print ('Failed to attach zipped file!')

# Send email ...
s = smtplib.SMTP('smtp.gmail.com', 587)
s.ehlo()
s.starttls()
s.login(u, up)
s.sendmail(fromaddr, toaddr, msg.as_string())
s.quit()

# Deleting created files
os.remove(new_name)
