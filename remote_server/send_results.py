# File Name: send_results.py
# Author: Ishan Kumar Lal
# Date Created: July 1st, 2014
# Description:
# - Coded using Python 3.4.1
# - Reads in user email and results file name
# - Creates new email, attaches file to it and send's the email to user's email address
# CADSP Lab @ Georgia Institute of Technology. Copyright 2014. All Rights Reserved.

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
if (len(sys.argv) == 3):
    users_email = str(sys.argv[1])
    file_name = str(sys.argv[2])
    print(users_email)
    print(file_name)
else:
    sys.exit("user email or results file not provided")

# Compose email ...
fromaddr = "fpaabot.dev@gmail.com"
toaddr = users_email
msg = MIMEMultipart()
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = "Results"
body = " "
msg.attach(MIMEText(body, 'plain'))
try:
    part = MIMEBase('application', "octet-stream")
    part.set_payload( open(file_name,"rb").read() )
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(file_name))
    msg.attach(part)
except:
    print ('Failed to attach zipped file!')

# Send email ...
s = smtplib.SMTP('smtp.gmail.com', 587)
s.ehlo()
s.starttls()
s.login(u, up)
s.sendmail(fromaddr, toaddr, msg.as_string())
s.quit()
