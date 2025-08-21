ssg=$(buildah from ubuntu:18.04)
buildah run $ssg apt-get update
buildah run $ssg apt-get install -y curl tar git
buildah config --workingdir /website-mikroways $ssg
buildah run $ssg sh -c \\n  "curl -sL https://github.com/gohugoio/hugo/releases/download/v0.122.0/hugo_extended_0.122.0_Linux-64bit.tar.gz \\n  | tar xzf - -C /usr/local/bin/"

buildah run $ssg git clone https://gitlab.com/mikroways/public/mikroways.net.git
buildah config --workingdir /website-mikroways/mikroways.net $ssg
buildah run $ssg hugo

final=$(buildah from docker.io/library/httpd:alpine)
buildah copy --from=$ssg $final /website-mikroways/mikroways.net/public/ /usr/local/apache2/htdocs/\n
buildah commit $final mikroways-website:latest
