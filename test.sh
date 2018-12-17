update_image() {
    echo "Updating image with rolling update"
    kubectl get pods
}

case $1 in
    'update-image')
        update_image 
        ;;
    *) echo "Choices should be ['update-image', 'update-static', 'update-all', 'start-all', 'delete-all']"
esac