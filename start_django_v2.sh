# !/bin/bash

# Take project name as input
if [ -z "$1" ] 
then
	echo "Project name: "
	read proj
else
	proj="$1"
fi

# Go to your Django Projects folder
cd /home/n/DjangoProjects

# Create the Virtual Environment and activate
virtualenv venv
source venv/bin/activate

# add some python packages you always use
echo "python-decouple" >> requirements.txt
echo "django-crispy-forms" >> requirements.txt
echo "django-cleanup" >> requirements.txt

#Install django in venv
echo "PIP_RESPECT_VIRTUALENV=true" >> venv/bin/activate
touch requirements.txt
echo "django" >> requirements.txt
pip install -r requirements.txt
pip freeze > requirements.txt

#Create project
python venv/lib/python3.8/site-packages/django/bin/django-admin.py startproject $proj
mv requirements.txt $proj/
mv venv $proj/
cd $proj/

# add some usefull files
touch .gitignore
echo "/.env" >> .gitignore
touch .env