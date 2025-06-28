#!/bin/bash
#clear

echo Current Directory is $PWD

#--------------------------------- use guilde --------------------------------
#./build.sh [PROFILE NAME] e.g. whant to build css profile with suffix as profile Name then use  ./build.sh css
#
#./build.sh [SUFFIX] [POROFILE NAME] , build provided profile and suffix name e.g. ./build.sh -cs css , build css profile with -cs as war suffix 
#-----------------------------------------------------------------------------


#-----------------------------------------Project List-------------------------------------------------------------------
PROJECTLIST=acme-commons,acme-crm,acme-scm,acme-accounting,acme-inventory,acme-hr,acme-tenants,acme-document
#------------------------------------------------------------------------------------------------------------------------


# Check expected arguments are provided or not ,if not provided then exit  
if [[ $# -eq 0 ]] ; then
    echo 'Required Parameter not provided, expcted SUFFIX PROFILE or PROFILE'
    exit 1
fi
 
# if only one argument provided then use it as profile name and use profile name as SUFFIX
if [[ $# -eq 1 ]] ; then
     # set profile as suffix with -
     SUFFIX=-$1
     # use first argument as PROFILE
     PROFILE=$1
else
   # use first argument as SUFFIX
   SUFFIX=$1
   # use second argument as PROFILE
   PROFILE=$2
fi

# if default profile provided then do not add prefix as it is going to use in dev env.
if [[ "$PROFILE" == "default" ]] ; then
  SUFFIX='';
  echo "Default profile found"
fi

echo suffix is $SUFFIX

MAVENPATH="/home/a/Padm/JavaEnv/apache-maven-3.3.9/bin"
echo   Maven Path is $MAVENPATH
echo -----------------------------------------------------------

#clear
 
echo You selected $SUFFIX as War suffix and  $PROFILE as Profile


echo "Building for profile " $PROFILE

echo $PROJECTLIST
# Iterates Project list and build it
#----------------------------------------------------------------------------------------

# go to main folder 
 
 SETTINGFILEPATH=$PWD/../../acme-document/profiles
 ROOTPATH=$PWD/../../
 echo Setting File path is $SETTINGFILEPATH
 
for i in $(echo $PROJECTLIST | sed "s/,/ /g")
    do        
	 
	#echo "Updating Source of $i"
	#echo "---------------------------------------------------------------" 
       # svn update --accept theirs-full $ROOTPATH/$i --non-interactive --no-auth-cache --username Nilesh --password abcd@123
	   #	rc=$?
	#	if [[ $rc -ne 0 ]] ; then
	#	  echo 'Error while Updating $i      '$rc; 
    #		  #exit $rc
	#	fi
	
	echo "--------------------- Build Started for $i --------------------"
	 
	echo "Building $i"
	$MAVENPATH/mvn -f $ROOTPATH/$i/pom.xml -s $SETTINGFILEPATH/settings.xml clean install -U -DskipTests -Dwar -Dwar-suffix=$SUFFIX -P$PROFILE -q
	rc=$?
	if [[ $rc -ne 0 ]] ; then
	  echo 'Maven Build Error, Error occored while building $i      '$rc; 
	  exit $rc
	fi
	
	echo "Built $i."        
         
done
#------------------------------------------------------------------

# remove war directory
rm -rf $ROOTPATH/acme-document/wars/$PROFILE

# Create directory for profile in war folder
mkdir -p $ROOTPATH/acme-document/wars/$PROFILE


echo "------------------------------------------------------------------------------------"
echo "copying war for " $PROFILE

#iterate each project and copy war into profile folder 
 
for i in $(echo $PROJECTLIST | sed "s/,/ /g")
    do
        #skip acme-commons-web output as it is jar , and it is referenced in other project's
	if [[ "$i" != "acme-commons" ]] ; then 
	  # copy war from target to wars folder 
         #echo coping $ROOTPATH/$i/$i-web/target/*.war to $ROOTPATH/acme-document/wars/$PROFILE
    	  cp  $ROOTPATH/$i/$i-web/target/*.war    $ROOTPATH/acme-document/wars/$PROFILE
    	  
    	    rc=$?
			if [[ $rc -ne 0 ]] ; then
			  echo 'Coping war error '$rc; 
			  exit $rc
			fi
	fi
	 
   done



