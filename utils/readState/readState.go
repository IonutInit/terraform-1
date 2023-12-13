package readState

import (
	"encoding/json"
	"os"
)

type TerraformState struct {
	Outputs map[string]Output `json:"outputs"`
}

type Output struct {
	Value interface{} `json:"value"`
}

func Read() (*TerraformState, error) {
	stateFilePath := "terraform.tfstate"

	data, err := os.ReadFile(stateFilePath)
	if err != nil {
		return nil, err
	}

	var state TerraformState
	err = json.Unmarshal(data, &state)
	if err != nil {
		return nil, err
	}

	return &state, nil
}
