package test

import (
	"testing"

	// "github.com/gruntwork-io/terratest/modules/aws"
	// "github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)

func TestNetwork(t *testing.T) {
	// t.Parallel()

	// terraformOptions := &terraform.Options{
	// 	TerraformDir: "..",

	// 	Vars: map[string]interface{}{
	// 		"vpc_name":           "nc-terraform",
	// 		"availability_zones": []string{"eu-west-2a", "eu-west-2b", "eu-west-2c"},
	// 		"cidr_range":         "10.0.0.0/16",
	// 	},
	// }

	// defer terraform.Destroy(t, terraformOptions)

	// terraform.InitAndApply(t, terraformOptions)

	// // Test VPC Name
	// vpcID := terraform.Output(t, terraformOptions, "vpc_id")
	// vpc := aws.GetVpcById(t, vpcID, "eu-west-2")
	// expectedVpcName := "nc-terraform"
	// assert.Equal(t, expectedVpcName, aws.GetTagsForVpc(t, vpc.Id, "eu-west-2")["Name"], "VPC name should match")

	// Test Public Subnets
	// region := "eu-west-2"
	// subnets := aws.GetSubnetsForVpc(t, vpcID, region)
	// for _, subnet := range subnets {
	//     isPublic := aws.IsPublicSubnet(t, subnet.Id, region)
	//     assert.True(t, isPublic, "Subnet should be public")
	// }
}
