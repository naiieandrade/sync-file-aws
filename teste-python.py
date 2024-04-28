import subprocess

s = subprocess.getstatusoutput('docker-compose up -d')

print(s)