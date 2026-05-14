-- return {
--   cmd = { '/opt/homebrew/bin/jdtls' },
--   filetypes = { 'java' },
--   root_markers = { 'pom.xml', 'build.gradle', '.git' },
-- }
return {
  cmd = { 'env', 'JAVA_HOME=/opt/homebrew/opt/openjdk@21', '/opt/homebrew/bin/jdtls' },
  filetypes = { 'java' },
  root_markers = { 'pom.xml', 'build.gradle', '.git' },
}
