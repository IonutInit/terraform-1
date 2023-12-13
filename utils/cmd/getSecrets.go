package cmd

import (
	"fmt"
	"github.com/IonutInit/ce-terraform-project/utils/readState"
	"os"
)

func GetSecrets() {
	state, err := readState.Read()
	if err != nil {
		fmt.Println("Error reading state file", err)
		return
	}

	accessKey, ok := state.Outputs["dynamodb_access_key"].Value.(string)
	if !ok {
		fmt.Println("Error retrieving access key")
		return
	}

	secretKey, ok := state.Outputs["dynamodb_secret_key"].Value.(string)
	if !ok {
		fmt.Println("Error retrieving secret key")
		return
	}

	content := fmt.Sprintf("ACCESS_KEY=%s\nSECRET_ACCESS_KEY=%s\n", accessKey, secretKey)
	err = os.WriteFile("ansible/files/.env.local", []byte(content), 0644)
	if err != nil {
		fmt.Println("Error writing secrets file:", err)
		return
	}

	fmt.Println("Obtained secrets")
}
