1 install [protobuf](https://grpc.io/docs/protoc-installation/) 

on mac : brew install protobuf

1.  dart pub global activate protoc_plugin
2.  Update your PATH so that the protoc compiler can find the plugin:
    1.  $ export PATH="$PATH:$HOME/.pub-cache/bin"

from protos dir
4.  sh protos_weebi/tool/generate_protos.sh

# on windows 
using WSL
get WSL
install dart on linux
install protobuf
dart pub global activate protoc_plugin
find a way to learn how to go back to line with linux file format

export PATH="$PATH:$HOME/.pub-cache/bin"
cd packages/protos
sh protos_weebi/tool/generate_protos.sh

***

note that id are used as key for offline first objects made in the weebi app, 
e.g. article, contact, ticket
primary key for those common at chain level (article,contact) is id & chainId
primary key for those at the boutique level (ticket) is id & chainId & boutiqueId

firmId is saved on all objects as a commodity