{{/* for iam project */}}
{{- define "keycloak.namespace" -}}
{{- "keycloak" -}}
{{- end -}}
{{- define "keycloak.helmRepo" -}}
{{- "https://codecentric.github.io/helm-charts" -}}
{{- end -}}


{{/* for storage project */}}
{{- define "rookCeph.namespace" -}}
{{- "rook-ceph" -}}
{{- end -}}
{{- define "rookCeph.helmUrl" -}}
{{- "https://charts.rook.io/release" -}}
{{- end -}}

{{/* Project Rules */}}
{{- define "deny.openNetworking" }}
  namespaceResourceBlacklist:
  - group: 'networking.k8s.io'
    kind: 'Ingress'
  - group: 'traefik.containo.us'
    kind: 'IngressRoute'
{{- end }}