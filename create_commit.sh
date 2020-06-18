#!/bin/bash

touch ../functional/.git/hooks/pre-commit
chmod +x ../functional/.git/hooks/pre-commit
echo "#!/bin/bash" > ../functional/.git/hooks/pre-commit
echo "./runTest.sh" >> ../functional/.git/hooks/pre-commit
echo "./checkFail.sh" >> ../functional/.git/hooks/pre-commit

echo "python3 slackbot.py" >> ../functional/.git/hooks/pre-commit

sed -e 's/:[^:\/\/]/=/g;s/$//g;s/ *=/=/g' ../functional/configure.yaml >> ../functional/.git/hooks/pre-commit
echo "SMTPSERVER=smtp.googlemail.com:587" >> ../functional/.git/hooks/pre-commit

echo "sendEmail -f \$SMTPFROM -t \$SMTPTO -u \$SUBJECT -o message-file=temp/text.txt -s \$SMTPSERVER -xu \$SMTPUSER -xp \$SMTPPASS" >> ../functional/.git/hooks/pre-commit

echo "rm -r temp/text.txt " >> ../functional/.git/hooks/pre-commit