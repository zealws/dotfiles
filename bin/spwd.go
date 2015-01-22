package main

import (
    "os"
    "fmt"
    "path"
    "strings"
)

const MAX_LENGTH = 35

func fullSplit(p string) []string {
    dir, file := path.Split(p)
    var result []string
    if dir == "/" {
        result = []string{"/"}
    } else if dir != "" {
        result = fullSplit(strings.TrimSuffix(dir, "/"))
    } else {
        result = make([]string, 0, 10)
    }
    if file != "" {
        result = append(result, file)
    }
    return result
}

func compress(p, home string) string {
    if p == "" || p == "/"{
        return p
    }
    p = path.Clean(p)
    result := ""
    if home != "" && strings.HasPrefix(p, home) {
        result = "~"
        p = strings.TrimPrefix(strings.TrimPrefix(p, home), "/")
    }
    parts := fullSplit(p)
    for i, part := range parts {
        possible := path.Join(result, path.Join(parts[i:]...))
        if len(possible) < MAX_LENGTH {
            return possible
        }
        result = path.Join(result, string(part[0]))
    }
    return result
}

func main() {
    wd, err := os.Getwd()
    if err != nil {
        fmt.Fprintf(os.Stderr, "%v\n", err)
    }
    fmt.Println(compress(wd, os.Getenv("HOME")))
}
