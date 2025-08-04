terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "vercel_project" "hotelbooking-frontend-prod" {
  name             = "hotelbooking-frontend-prod"
  build_command    = "nx build --skip-nx-cache hotelbooking-frontend"
  output_directory = "./dist/apps/hotelbooking/frontend/.next"
  framework        = "nextjs"
  team_id          = "team_2TjV6297LA267czkNg94ORef"
}
resource "vercel_project" "hotelbooking-frontend-testing" {
  name             = "hotelbooking-frontend-testing"
  build_command    = "nx build --skip-nx-cache hotelbooking-frontend"
  output_directory = "./dist/apps/hotelbooking/frontend/.next"
  framework        = "nextjs"
  team_id          = "team_2TjV6297LA267czkNg94ORef"
}

variable "VERCEL_TOKEN" {
  type        = string
  description = "Optionally say something about this variable"
}

provider "vercel" {
  # Or omit this for the api_token to be read
  # from the VERCEL_API_TOKEN environment variable
  api_token = var.VERCEL_TOKEN

  # Optional default team for all resources
  team = "team_2TjV6297LA267czkNg94ORef"
}