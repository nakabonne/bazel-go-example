package test

import (
	"testing"

	"github.com/gomodule/redigo/redis"
	"github.com/stretchr/testify/require"
)

func TestConnection(t *testing.T) {
	c, err := redis.Dial("tcp", "redis:6379")
	require.NoError(t, err)
	defer c.Close()

	_, err = c.Do("SET", "key", 1)
	require.NoError(t, err)
}
