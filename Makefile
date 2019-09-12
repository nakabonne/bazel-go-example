BAZEL_FLAGS =
BAZEL_COMMAND_FLAGS =

ifdef EXTENDED_BAZEL_RC
	BAZEL_FLAGS += --bazelrc=${EXTENDED_BAZEL_RC}
endif

ifdef IS_CI
	BAZEL_COMMAND_FLAGS += --config=ci
endif

.PHONY: build
build:
	bazelisk ${BAZEL_FLAGS} build ${BAZEL_COMMAND_FLAGS} -- //...

.PHONY: test
test:
	bazelisk ${BAZEL_FLAGS} test ${BAZEL_COMMAND_FLAGS} --config=unit //...

.PHONY: test-integration
test-integration:
	bazelisk ${BAZEL_FLAGS} test ${BAZEL_COMMAND_FLAGS} --config=integration --test_output=all //...

.PHONY: dep
dep:
	GO111MODULE=on go mod tidy
	GO111MODULE=on go mod vendor
	bazelisk run //:gazelle -- update-repos -from_file=go.mod

.PHONY: gazelle
gazelle:
	bazelisk run //:gazelle

.PHONY: buidifier
buidifier:
	bazelisk run //:buildifier

.PHONY: clean
clean:
	bazelisk clean
