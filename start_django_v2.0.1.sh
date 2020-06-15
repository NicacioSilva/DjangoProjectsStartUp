
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
virtualenv env
source env/bin/activate

#Install django
pip install django

#Create project
python env/lib/python3.8/site-packages/django/bin/django-admin.py startproject $proj
deactivate
rm -r env/
cd $proj/

# add some python packages you always use and also Django of course
echo "python-decouple" >> requirements.txt
echo "django-crispy-forms" >> requirements.txt
echo "django-cleanup" >> requirements.txt
echo "django" >> requirements.txt
virtualenv env
source env/bin/activate
pip install -r requirements.txt
pip freeze > requirements.txt

# add some usefull files
touch .gitignore
echo "/.env" >> .gitignore
touch .env 
