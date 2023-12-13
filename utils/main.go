package main

import (
	"flag"
	"github.com/IonutInit/ce-terraform-project/utils/cmd"
	"log"
)

func main() {
	action := flag.String("action", "", "Action to perform: getInventory, getSecrets, or both (default)")
	flag.Parse()

	if *action == "" || *action == "getInventory" {
		cmd.GetInventory()
	}
	if *action == "" || *action == "getSecrets" {
		cmd.GetSecrets()
	}

	if *action != "" && *action != "getInventory" && *action != "getSecrets" {
		log.Fatalf("Invalid action: %s", *action)
	}
}
