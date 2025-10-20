#install latest lts
choco install python --version=3.12.4

py -m pip install --user virtualenv

#add to path
#C:\Users\z157425\AppData\Local\Programs\Python\Python312\python.exe -m pip install --upgrade pip
#WARNING: The script virtualenv.exe is installed in 'C:\Users\z157425\AppData\Roaming\Python\Python312\Scripts' which is not on PATH.
#Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.


#create venv current dir
py -m venv .

pip install numpy 
pip install pandas 
pip install fastparquet
pip install sqlalchemy 