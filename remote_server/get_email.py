# File Name: get_email.py
# Author: Ishan Kumar Lal
# Date Created: June 30th, 2014
# Description:
# - Coded using Python 3.4.1
# - Uses POP3 protocol
# - Authenticates into a users Google Email Account and pops off new email messages from the server
# - Prints number of new messages received from server
# - Parses and prints subject of each new message in a new line
# - Successful/Unsuccessful connection close with gmail server
# - Detects and Extracts attachments of any extension type and places them in a folder named after the subject line
# - Can send email with or without attachments
# - Can Zip files of a folder together
# - Can Unzip files into a folder
# - Can execute command line commands for USB access
# CADSP Lab @ Georgia Institute of Technology. Copyright 2014. All Rights Reserved.

# importing libraries ...
import poplib, getpass, email, os, smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# Establishing connection ...
Mail = poplib.POP3_SSL('pop.gmail.com')

# Authenticating ...
#u = input('Gmail username: ')
#up = getpass.getpass()
Mail.user('fpaabot.dev@gmail.com')
Mail.pass_('cadsp_fpaa')

# Count messages ...
numMessages = len(Mail.list()[1])
print("You have", numMessages, "new messages")

# printing message content ...
for i in range(numMessages):
    for j in Mail.retr(i+1)[1]:
        print('Message can be printed here (Lot of garbage will appear on prompt)')
        #print (j)

# printing subjects ...
for msgL in range(numMessages):
    for mmm in (Mail.retr(msgL+1)[1]):
        if mmm.startswith(b'Subject'):
            print('Printing Subject...')
            print('\t', mmm)
            
#f = open('file_1.blah', 'wb')

# Create Storage directory ...
detach_dir = '/home/cadsp/RASP_Workspace/'
#if 'attachments' not in os.listdir(detach_dir):
#    os.mkdir('attachments')
    
try:
# Parse Email to extract attachments ...
    for msg_list in range(numMessages):
        # Retriving message, flag gets set to seen here
        msg = Mail.retr(msg_list+1)[1]
        mail = email.message_from_bytes(b'\n'.join(msg))
        print(mail['Subject'])
        users_email = mail['Subject']
        #dir_name = dir_name.replace(':', '_')
        #dir_name = dir_name.replace(' ', '_')
        #if dir_name not in os.listdir(detach_dir):
        #    os.mkdir(detach_dir+dir_name)
        for part in mail.walk():
            print('inside message')
            print(part.get_content_maintype())
            if part.get_content_maintype() == 'multipart':
                continue
            if part.get('Content-Disposition') is None:
                continue
            fileName = part.get_filename()
            print('FILENAME' + fileName)
            if fileName not in os.listdir(detach_dir):
                os.mkdir(detach_dir+fileName)
            print('FILENAME' + fileName)
            print(bool(fileName))
            print('FILENAME IS THERE, DETACHING ATTACHMENTS NOW')
            if bool(fileName):
                filePath = os.path.join(detach_dir, fileName, fileName)
                print('FILEPATH: ' + filePath)
                if not os.path.isfile(filePath) :
                    print ('Im here' + filePath)
                    fp = open(filePath, 'wb')
                    print('opened!')
                    fp.write(part.get_payload(decode=True))
                    print('closing!')
                    fp.close()
                    print('Downloaded attached file')
        os.system("pwd")
        os.chdir(detach_dir + fileName)
        os.system("mv " + fileName + " anyName.zip")
        os.system("unzip -jo anyName.zip")
        os.system("rm -rf anyName.zip")
        os.system("pwd")
        print(users_email)	
        os.system("/opt/python3.4/bin/python3.4 /home/cadsp/rasp30/remote_server/program_fpaa.py")
        # zip hex files and send to user email address
        zip_name = 'results.zip'
        f1 = 'output_vector'
        os.system("zip " + zip_name + " " + f1)
        os.system("/opt/python3.4/bin/python3.4 /home/cadsp/rasp30/remote_server/send_results.py " + users_email + " " +zip_name)
except:
    print('Failed to download all attachments')

# closing connection with server ...
Mail.quit()
