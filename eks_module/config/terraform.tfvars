
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-0c7c83e0e2dad9072","subnet-04696e4a6d8130f8e","subnet-0975513fbf0e02dff"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-0c7c83e0e2dad9072","subnet-04696e4a6d8130f8e","subnet-0975513fbf0e02dff	"]

        tags = {
             "Name" =  "node1"
         } 
  }
}