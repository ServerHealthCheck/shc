#!/bin/bash
storage_used=$(bash $HOME/shc_scripts/storage_used.sh)
storage_total=$(bash $HOME/shc_scripts/storage_total.sh)

echo $(( (storage_used*100)/storage_total ))                                            
