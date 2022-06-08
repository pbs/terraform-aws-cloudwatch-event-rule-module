package test

import (
	"testing"
)

func TestLambdaExample(t *testing.T) {
	testCloudWatchEventRule(t, "lambda")
}
