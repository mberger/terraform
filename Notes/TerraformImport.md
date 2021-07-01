# How do you import existing resources into Terraform from AWS? | Terraform Import command

Let's say that you have created EC2 instances manually. If you like to attach your EC2 instance to Terraform you can use import command.

The __terraform import__ command is used to import existing infrastructure. The command currently can only import one resource at a time. This means you can't yet point Terraform import to an entire collection of resources such as an AWS VPC and import all of it.

To import a resource, create a tf file first write a resource block for it in your configuration, establishing the name by which it will be known to Terraform:



<code>sudo vi myec2.tf</code>

<pre>resource "aws_instance" "myinstance" {
...instance configuration...leave this as it is

}</pre>

Go to the console and get the instance ID
(screenshot here later)

execute the below command:

<code>terraform import aws_instance.myinstance i-abcd1234</code>
