echo "Checking Git is working"
if ! git --version
then
    echo "ERROR!"
    echo "Unable to find working Git installation"
    echo "Please check you're running this script in the correct environment"
    return
fi

echo
echo "Downloading recipe.zip"
curl https://imperialcollegelondon.github.io/grad_school_git_course/code/recipe.zip --output recipe.zip

if [ -d ./recipe ]
then
    echo "ERROR!"
    echo "A directory called 'recipe' already exists please remove this to proceed"
    echo "The directory can be removed with the command: rm -rf recipe"
    return
fi

echo
echo "Extracting recipe.zip"
if unzip recipe.zip && cd recipe 
then
    echo
    echo "Setup succesful. You're ready to proceed with the course"
else
    echo "ERROR!"
    echo "Extraction of zip archive failed"
fi
