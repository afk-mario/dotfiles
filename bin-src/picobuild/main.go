package main

import (
	"errors"
	"fmt"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/urfave/cli/v2"
)

func fileExists(path string) bool {
	_, err := os.Stat(path)
	return !os.IsNotExist(err)
}

func check(path string) error {
	fmt.Println("path", path)
	if !fileExists(path) {
		return errors.New("File doesn't exist")
	}
	return nil
}

func build(path string, game string, color string) {
	fmt.Println("Building the game:", game)
	pico := os.ExpandEnv("$HOME/apps/pico-8/pico-8/pico8")
	bin := fmt.Sprintf("%s.bin", game)

	_, err := exec.Command(pico, path, "-export", "index.html").Output()
	_, err = exec.Command(pico, path, "-export", bin).Output()

	if err != nil {
		log.Fatal(err)
	}

	zip := fmt.Sprintf("%s.zip", game)

	_, err = exec.Command("sed", "-i", fmt.Sprintf("s/background-color:#222/background-color:%s/g", color), "index.html").Output()

	if err != nil {
		log.Fatal(err)
	}

	_, err = exec.Command("zip", zip, "index.html", "index.js").Output()

	if err != nil {
		log.Fatal(err)
	}

	deploy(zip, bin, game)
	// clean(zip, bin)
}

//TODO: Allow skip platforms
func deploy(zip string, bin string, game string) {
	fmt.Println("Deploying:", game)
	platforms := [4]string{"windows", "linux", "osx", "raspi"}
	pushPathWeb := fmt.Sprintf("afk-mario/%s:html5", game)

	out, err := exec.Command("butler", "push", zip, pushPathWeb).CombinedOutput()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(string(out))

	for _, platform := range platforms {
		push := fmt.Sprintf("afk-mario/%s:%s", game, platform)
		pull := fmt.Sprintf("%s/%s_%s.zip", bin, game, platform)
		fmt.Println("pushing", push)
		fmt.Println("pulling", pull)
		out, err := exec.Command("butler", "push", pull, push).CombinedOutput()
		if err != nil {
			log.Fatal(err)
		}

		fmt.Println(string(out))
	}
}

func clean(zip string, bin string) {
	fmt.Println("Removing generated files")

	err := os.Remove("index.html")
	if err != nil {
		log.Fatal(err)
	}

	err = os.Remove("index.js")
	if err != nil {
		log.Fatal(err)
	}

	err = os.Remove(zip)
	if err != nil {
		log.Fatal(err)
	}

	err = os.RemoveAll(bin)
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	// var game string
	var color string

	app := &cli.App{
		Name:  "picobuild",
		Usage: "Tool for building and pushing PICO-8 games",
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "color",
				Aliases:     []string{"c"},
				Value:       "#000",
				Usage:       "Background color for web export `#000`",
				Destination: &color,
			},
		},

		Action: func(c *cli.Context) error {
			if c.NArg() > 0 {
				path := c.Args().Get(0)
				_, file := filepath.Split(path)
				game := strings.Split(file, ".")[0]
				err := check(path)
				if err != nil {
					return err
				}
				build(path, game, color)
			}

			return nil
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
