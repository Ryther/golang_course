package main

import (
	"fmt"
	"math/bits"
	"strings"
)

type ByteSize uint

const (
	_  ByteSize = 1 << (10 * iota)
	KB ByteSize = 1 << (10 * iota)
	MB ByteSize = 1 << (10 * iota)
	GB ByteSize = 1 << (10 * iota)
	TB ByteSize = 1 << (10 * iota)
	PB ByteSize = 1 << (10 * iota)
	EB ByteSize = 1 << (10 * iota)
)

func main() {
	constants := []ByteSize{KB, MB, GB, TB, PB, EB}
	var total_tabs int = ((bits.Len(uint(constants[len(constants)-1])) - 11) / 10) - 2
	for i, bit := range constants {
		fmt.Printf("%d%s%b\n", bit, strings.Repeat("\t", total_tabs), bit)
		total_tabs += ((bits.Len(uint(constants[i])) / 10) % 2) - 1
	}
}
