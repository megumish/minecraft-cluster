// local argocd = import 'argocd.libsonnet';
// local application = argocd.v1alpha1.application;
// local appMeta = application.metadata;
// local appSpec = application.spec;

// application.new(
//   'storage-app',
// ) + appMeta.withFinalizers('resources-finalaizer.argocd.argoproj.io')
// + appSpec.withProject('storage-project')
local k = import 'k.libsonnet';
k.apps.v1.deployment.new(name='foo', containers=[
  k.core.v1.container.new(name='foo', image='foo/bar'),
])
