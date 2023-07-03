resource "kubernetes_service_account" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = "dev"
  }
}

resource "kubernetes_cluster_role" "jenkins_role" {
  metadata {
    name = "Jenkins-Role"
  }

  rule {
    api_groups = [""]
    resources  = ["deployments","configmaps"]
    verbs      = ["get", "watch", "list", "create"]
  }
}

resource "kubernetes_cluster_role_binding" "jenkins_role_binding" {
  metadata {
    name = "Jenkins-RoleBinding"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.jenkins.metadata[0].name
    namespace = kubernetes_service_account.jenkins.metadata[0].namespace
  }

  role_ref {
    kind     = "ClusterRole"
    name     = kubernetes_cluster_role.jenkins_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role" "tools_role" {
  metadata {
    name = "Tools-Role"
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments"]
    verbs      = ["create", "get", "watch", "list", "patch", "delete"]
  }

  rule {
    api_groups = [""]
    resources  = ["secrets","configmaps"]
    verbs      = ["get", "watch", "list","create","patch","delete"]
  }
}

resource "kubernetes_cluster_role_binding" "tools_role_binding" {
  metadata {
    name = "Tools-RoleBinding"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "tools"
  }

  role_ref {
    kind     = "ClusterRole"
    name     = kubernetes_cluster_role.tools_role.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }
}
