workspace(
    name = "bazel_go_example",
)

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)
load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
)

### Rules_go and gazelle
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "313f2c7a23fecc33023563f082f381a32b9b7254f727a7dd2d6380ccc6dfe09b",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.19.3/rules_go-0.19.3.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/0.19.3/rules_go-0.19.3.tar.gz",
    ],
)

load(
    "@io_bazel_rules_go//go:deps.bzl",
    "go_register_toolchains",
    "go_rules_dependencies",
)

go_rules_dependencies()

go_register_toolchains(
    go_version = "1.12.9",
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "be9296bfd64882e3c08e3283c58fcb461fa6dd3c171764fcc4cf322f60615a9b",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/0.18.1/bazel-gazelle-0.18.1.tar.gz",
    ],
)

load(
    "@bazel_gazelle//:deps.bzl",
    "gazelle_dependencies",
    "go_repository",
)

gazelle_dependencies()

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "96def97196a4d8182de97dccf49afc4097a37d451bc9219b7052e8669421f967",
    strip_prefix = "buildtools-0.22.0",
    url = "https://github.com/bazelbuild/buildtools/archive/0.22.0.zip",
)

load(
    "@com_github_bazelbuild_buildtools//buildifier:deps.bzl",
    "buildifier_dependencies",
)

buildifier_dependencies()

### Docker
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "aed1c249d4ec8f703edddf35cbe9dfaca0b5f5ea6e4cd9e83e99f3b0d1136c3d",
    strip_prefix = "rules_docker-0.7.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.7.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

container_pull(
    name = "base_alpine3.9.3",
    registry = "index.docker.io",
    repository = "library/alpine",
    tag = "3.9.3",
)

### Bazel gomock

git_repository(
    name = "bazel_gomock",
    commit = "ff6c20a9b6978c52b88b7a1e2e55b3b86e26685b",
    remote = "https://github.com/jmhodges/bazel_gomock.git",
)

### Protoc-gen-validate

go_repository(
    name = "com_github_envoyproxy_protoc_gen_validate",
    build_file_proto_mode = "disable",
    importpath = "github.com/envoyproxy/protoc-gen-validate",
    tag = "v0.0.14",
)

go_repository(
    name = "com_github_gomodule_redigo",
    importpath = "github.com/gomodule/redigo",
    tag = "v2.0.0",
)

go_repository(
    name = "com_github_davecgh_go_spew",
    importpath = "github.com/davecgh/go-spew",
    tag = "v1.1.0",
)

go_repository(
    name = "com_github_pmezard_go_difflib",
    importpath = "github.com/pmezard/go-difflib",
    tag = "v1.0.0",
)

go_repository(
    name = "com_github_stretchr_objx",
    importpath = "github.com/stretchr/objx",
    tag = "v0.1.0",
)

go_repository(
    name = "com_github_stretchr_testify",
    importpath = "github.com/stretchr/testify",
    tag = "v1.3.0",
)
