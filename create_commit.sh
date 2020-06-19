#!/bin/bash

touch ../functional/.git/hooks/pre-commit
chmod +x ../functional/.git/hooks/pre-commit
echo "#!/bin/bash" > ../functional/.git/hooks/pre-commit
echo "./runTest.sh" >> ../functional/.git/hooks/pre-commit

echo "num=\`grep \"FAIL\" -w  temp/text.txt \`" >> ../functional/.git/hooks/pre-commit
echo "echo \$num" >> ../functional/.git/hooks/pre-commit
echo "if [ \"\$num\" !=  \"\" ]" >> ../functional/.git/hooks/pre-commit
echo "then" >> ../functional/.git/hooks/pre-commit
echo "        echo \"Test FAIL\"" >> ../functional/.git/hooks/pre-commit
echo "        rm -r temp/text.txt" >> ../functional/.git/hooks/pre-commit
echo "        exit 1" >> ../functional/.git/hooks/pre-commit
echo "fi" >> ../functional/.git/hooks/pre-commit

sed -e 's/:[^:\/\/]/=/g;s/$//g;s/ *=/=/g' ../functional/configure.yaml >> ../functional/.git/hooks/pre-commit
echo "enter your app password"
read var

echo SMTPPASS=$var >> ../functional/.git/hooks/pre-commit
echo "SMTPSERVER=smtp.googlemail.com:587" >> ../functional/.git/hooks/pre-commit

echo "sendEmail -f \$SMTPFROM -t \$SMTPTO -u \$SUBJECT -o message-file=temp/text.txt -s \$SMTPSERVER -xu \$SMTPUSER -xp \$SMTPPASS" >> ../functional/.git/hooks/pre-commit
echo "enter your API TOKEN"
read api_token
echo python3 slackbot.py $api_token >> ../functional/.git/hooks/pre-commit
echo "YOUR pre-commit hook is created successfully"
echo "rm -r temp/text.txt " >> ../functional/.git/hooks/pre-commit