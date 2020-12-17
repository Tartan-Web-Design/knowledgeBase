#!/usr/bin/env bash


function doStatus {

#################################################################################################
#                                                                                               # 
# function: doStatus                                                                          #
#                                                                                               #  
#################################################################################################

echo 'Checking status...'

ssh root@165.232.110.116 'bash -s' < ./scsCheckStatus.sh

}

function doCheckOut {

#################################################################################################
#                                                                                               # 
# function: doCheckOut                                                                          #
#                                                                                               #  
#################################################################################################

echo 'Attempting to check out...'

ssh root@165.232.110.116 'bash -s' < ./scsCheckOut.sh $s $n

}

function doCheckIn {

#################################################################################################
#                                                                                               # 
# function: doCheckIn                                                                           #
#                                                                                               #  
#################################################################################################

echo 'Attempting to check in...'

ssh root@165.232.110.116 'bash -s' < ./scsCheckIn.sh $s
}

function doList {

#################################################################################################
#                                                                                               # 
# function: doCheckIn                                                                           #
#                                                                                               #  
#################################################################################################

echo 'Listing valid sites...'

ssh root@165.232.110.116 'bash -s' < ./scsCheckList.sh
}

function doCreate {

#################################################################################################
#                                                                                               # 
# function: doCheckIn                                                                           #
#                                                                                               #  
#################################################################################################

echo doCreate

echo 'Attempting to add new site to the list...'

ssh root@165.232.110.116 'bash -s' < ./scsCreate.sh $s
}

#################################################################################################
#                                                                                               # 
# function: main                                                                                #
#                                                                                               #        
#                                                                                               #     
#################################################################################################


# Pull in and parse the command line variables
# 

usage() { echo "Usage: $0 [-m <list|status|create|checkout|checkin>] [-s <sitename>] [-n <username>]" 1>&2; exit 1; }

    if [[ $# -eq 0 ]]
        then
            usage
    fi

while getopts ":m:s:n:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
            ;;
        m)
            m=${OPTARG}
            ;;
        n)
            n=${OPTARG}
            ;;
            
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

case $m in
               status)
                    doStatus
                :  # Do nothing
                ;;
                list)
                    doList
                :  # Do nothing
                ;;
                create)
                if [ -z "${m}" ] || [ -z "${s}" ] ; then
                    echo 'create requires a sitename, see: '
                    usage
                else
                    doCreate
                fi
                    
                :  # Do nothing
                ;;
                checkout)
                if [ -z "${m}" ] || [ -z "${s}" ] || [ -z "${n}" ] ; then
                    echo 'checkout requires a sitename and a username see: '
                    usage
                else
                    doCheckOut
                fi
                    
                :  # Do nothing
                ;;
                checkin)
                if [ -z "${m}" ] || [ -z "${s}" ] ; then
                    usage
                else
                    doCheckIn
                fi
                    
                :  # Do nothing
                ;;
                *)
                    usage
                    exit 1
                ;;
esac


