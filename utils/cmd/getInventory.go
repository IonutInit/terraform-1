package cmd

import (
	"fmt"
	"github.com/IonutInit/ce-terraform-project/utils/readState"
	"log"
	"os"
	"strings"
)

type TerraformOutput struct {
	Outputs struct {
		PublicIPs struct {
			Value map[string]string `json:"value"`
		} `json:"public_ips"`
	} `json:"outputs"`
}

func GetInventory() {
	state, err := readState.Read()
	if err != nil {
		log.Fatalf("Error reading state file: %s", err)
	}

	publicIPs, ok := state.Outputs["public_ips"].Value.(map[string]interface{})
	if !ok {
		fmt.Println("Error retrieving public IPs")
		return
	}

	groupedIPs := make(map[string][]string)
	for key, value := range publicIPs {
		group := strings.Split(key, "-")[0]
		ip, ok := value.(string)
		if !ok {
			fmt.Printf("Error parsing IP for %s\n", key)
			continue
		}
		groupedIPs[group] = append(groupedIPs[group], ip)
	}

	file, err := os.Create("./ansible/inventory")
	if err != nil {
		log.Fatalf("Error creating inventory file: %s", err)
	}
	defer file.Close()

	for group, ips := range groupedIPs {
		fmt.Fprintf(file, "[%s]\n", group)
		for _, ip := range ips {
			fmt.Fprintf(file, "ubuntu@%s\n", ip)
		}
		fmt.Fprintln(file)
	}

	fmt.Println("Obtained IP inventory")
}
