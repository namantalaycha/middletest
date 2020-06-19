#!/bin/bash
read loc
touch ../$loc/.git/hooks/pre-commit
chmod +x ../$loc/.git/hooks/pre-commit
echo "#!/bin/bash" > ../$loc/.git/hooks/pre-commit
echo "./runTest.sh" >> ../$loc/.git/hooks/pre-commit

sed -e 's/:[^:\/\/]/=/g;s/$//g;s/ *=/=/g' ../$loc/configure.yaml >> ../$loc/.git/hooks/pre-commit
echo "enter your app password"
read var
echo SMTPPASS=$var >> ../$loc/.git/hooks/pre-commit
echo "SMTPSERVER=smtp.googlemail.com:587" >> ../$loc/.git/hooks/pre-commit

echo "sendEmail -f \$SMTPFROM -t \$SMTPTO -u \$SUBJECT -o message-file=temp/text.txt -s \$SMTPSERVER -xu \$SMTPUSER -xp \$SMTPPASS" >> ../$loc/.git/hooks/pre-commit

echo "enter your API TOKEN"
read api_token
echo python3 slackbot.py $api_token >> ../$loc/.git/hooks/pre-commit


echo "num=\`grep \"FAIL\" -w  temp/text.txt \`" >> ../$loc/.git/hooks/pre-commit
echo "echo \$num" >> ../$loc/.git/hooks/pre-commit
echo "if [ \"\$num\" !=  \"\" ]" >> ../$loc/.git/hooks/pre-commit
echo "then" >> ../$loc/.git/hooks/pre-commit
echo "        echo \"Test FAIL\"" >> ../$loc/.git/hooks/pre-commit
echo "        rm -r temp/text.txt" >> ../$loc/.git/hooks/pre-commit
echo "        exit 1" >> ../$loc/.git/hooks/pre-commit
echo "fi" >> ../$loc/.git/hooks/pre-commit

echo "rm -r temp/text.txt " >> ../$loc/.git/hooks/pre-commit

echo "YOUR pre-commit hook is created successfully"