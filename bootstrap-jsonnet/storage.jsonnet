local params = import './storage.libsonnet';
local cloudProvider = std.extVar('cloudProvider');

local rookCeph = {
  namespace: 'rook-ceph',
  repoUrl: 'https://charts.rook.io/release',
};
local postgres = {
  namespace: 'postgres',
  targetRevision: 'v1.7.1',
  repoUrl: 'https://github.com/zalando/postgres-operator',
};
local networkResources = import './network-resources.libsonnet';

function(
  gitRepositoryUrl='',
  argocd={
    namespace: '',
  },
  targetRevision='',
) [
  {
    apiVersion: 'argoproj.io/v1alpha1',
    kind: 'Application',
    metadata: {
      name: 'storage',
      finalizers: [
        'resources-finalizer.argocd.argoproj.io',
      ],
    },
    spec: {
      project: 'storage-project',

      source: {
        repoURL: gitRepositoryUrl,
        targetRevision: targetRevision,
        path: 'storage',
        helm: {
          parameters: [
            {
              name: 'argocd.namespace',
              value: argocd.namespace,
            },
            {
              name: 'gitRepositoryUrl',
              value: gitRepositoryUrl,
            },
            {
              name: 'targetRevision',
              value: targetRevision,
            },
            {
              name: 'rookCeph.namespace',
              value: rookCeph.namespace,
            },
            {
              name: 'rookCeph.helmUrl',
              value: rookCeph.repoUrl,
            },
            {
              name: 'postgresOperator.namespace',
              value: postgres.namespace,
            },
            {
              name: 'postgresOperator.repoUrl',
              value: postgres.repoUrl,
            },
            {
              name: 'postgresOperator.targetRevision',
              value: postgres.targetRevision,
            },
            {
              name: 'cloudProvider.storageClass',
              value: cloudProvider.storageClass,
            },
          ],
        },
      },

      destination: {
        server: 'https://kubernetes.default.svc',
        namespace: argocd.namespace,
      },

      syncPolicy: {
        automated: {
          prune: true,
          selfHeal: true,
          allowEmpty: true,
        },
        syncOptions: [
          'Validate=true',
          'CreateNamespace=true',
          'PrunePropagationPolicy=foreground',
          'PruneLast=true',
        ],
        retry: {
          limit: 5,
          backoff: {
            duration: '30s',
            factor: 2,
            maxDuration: '3m',
          },
        },
      },
    },
  },
  {
    apiVersion: 'argoproj.io/v1alpha1',
    kind: 'AppProject',
    metadata: {
      name: 'storage-project',
      finalizers: [
        'resources-finalizer.argocd.argoproj.io',
      ],
    },
    spec: {
      description: 'Project for storage',

      sourceRepos: [
        gitRepositoryUrl,
        rookCeph.repoUrl,
        postgres.repoUrl,
      ],

      destinations: [
        {
          namespace: argocd.namespace,
          server: 'https://kubernetes.default.svc',
        },
        {
          namespace: rookCeph.namespace,
          server: 'https://kubernetes.default.svc',
        },
        {
          namespace: postgres.namespace,
          server: 'https://kubernetes.default.svc',
        },
      ],

      clusterResourceWhitelist: [
        {
          group: '*',
          kind: '*',
        },
      ],

      namespaceResourceWhitelist: [
        {
          group: '*',
          kind: '*',
        },
      ],

      namespaceResourceBlacklist: std.flattenArrays([
        networkResources,
      ]),

      orphanedResources: {
        warn: true,
      },

      roles: [
        {
          name: 'read-only',
          description: 'Read-only privileges to storage resources',
          policies: [
            'p, proj:storage-project:read-only, applications, get, storage-project/*, allow',
          ],
        },
      ],
    },
  },
]
