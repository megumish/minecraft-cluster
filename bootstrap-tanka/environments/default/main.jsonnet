function(
  thisRepositoryUrl='this.repository.example.com',
  thisRepositoryRevision='deadbeaf'
)
  (import 'storage.jsonnet') +
  {
    _config:: {
      thisRepositoryUrl: thisRepositoryUrl,
      thisRepositoryRevision: thisRepositoryRevision,
      storage: {
      },
    },
  }
