
# ---- Helm Release Configuration ----

name                        = "devsecops-app" # name of the helm release
namespace                   = "default"       # namespace of the helm release
replica_count               = 2               # replica count
image_tag                   = ""
ecr_repo_url                = "" # ecr repo url
cluster_name                = ""
cluster_ca_certificate_data = ""
cluster_endpoint            = ""

