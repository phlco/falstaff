require 'pry'
require 'httparty'
require 'json'

GITHUB_PAYLOAD = {
  "zen" => "Speak like a human.",
  "hook_id" => 3318009,
  "hook" => {
    "url" => "https://api.github.com/repos/ga-students/godot_instructors/hooks/3318009",
    "test_url" => "https://api.github.com/repos/ga-students/godot_instructors/hooks/3318009/test",
    "id" => 3318009,
    "name" => "web",
    "active" => true,
    "events" => [
      "*"
    ],
    "config" => {
      "url" => "http://sir-john-falstaff.herokuapp.com/postreceive",
      "content_type" => "json",
      "insecure_ssl" => "0",
      "secret" => ""
    },
    "last_response" => {
      "code" => nil,
      "status" => "unused",
      "message" => nil
    },
    "updated_at" => "2014-10-28T00:20:09Z",
    "created_at" => "2014-10-28T00:20:09Z"
  },
  "repository" => {
    "id" => 25827493,
    "name" => "godot_instructors",
    "full_name" => "ga-students/godot_instructors",
    "owner" => {
      "login" => "ga-students",
      "id" => 5048067,
      "avatar_url" => "https://avatars.githubusercontent.com/u/5048067?v=2",
      "gravatar_id" => "",
      "url" => "https://api.github.com/users/ga-students",
      "html_url" => "https://github.com/ga-students",
      "followers_url" => "https://api.github.com/users/ga-students/followers",
      "following_url" => "https://api.github.com/users/ga-students/following{/other_user}",
      "gists_url" => "https://api.github.com/users/ga-students/gists{/gist_id}",
      "starred_url" => "https://api.github.com/users/ga-students/starred{/owner}{/repo}",
      "subscriptions_url" => "https://api.github.com/users/ga-students/subscriptions",
      "organizations_url" => "https://api.github.com/users/ga-students/orgs",
      "repos_url" => "https://api.github.com/users/ga-students/repos",
      "events_url" => "https://api.github.com/users/ga-students/events{/privacy}",
      "received_events_url" => "https://api.github.com/users/ga-students/received_events",
      "type" => "Organization",
      "site_admin" => false
    },
    "private" => true,
    "html_url" => "https://github.com/ga-students/godot_instructors",
    "description" => "",
    "fork" => false,
    "url" => "https://api.github.com/repos/ga-students/godot_instructors",
    "forks_url" => "https://api.github.com/repos/ga-students/godot_instructors/forks",
    "keys_url" => "https://api.github.com/repos/ga-students/godot_instructors/keys{/key_id}",
    "collaborators_url" => "https://api.github.com/repos/ga-students/godot_instructors/collaborators{/collaborator}",
    "teams_url" => "https://api.github.com/repos/ga-students/godot_instructors/teams",
    "hooks_url" => "https://api.github.com/repos/ga-students/godot_instructors/hooks",
    "issue_events_url" => "https://api.github.com/repos/ga-students/godot_instructors/issues/events{/number}",
    "events_url" => "https://api.github.com/repos/ga-students/godot_instructors/events",
    "assignees_url" => "https://api.github.com/repos/ga-students/godot_instructors/assignees{/user}",
    "branches_url" => "https://api.github.com/repos/ga-students/godot_instructors/branches{/branch}",
    "tags_url" => "https://api.github.com/repos/ga-students/godot_instructors/tags",
    "blobs_url" => "https://api.github.com/repos/ga-students/godot_instructors/git/blobs{/sha}",
    "git_tags_url" => "https://api.github.com/repos/ga-students/godot_instructors/git/tags{/sha}",
    "git_refs_url" => "https://api.github.com/repos/ga-students/godot_instructors/git/refs{/sha}",
    "trees_url" => "https://api.github.com/repos/ga-students/godot_instructors/git/trees{/sha}",
    "statuses_url" => "https://api.github.com/repos/ga-students/godot_instructors/statuses/{sha}",
    "languages_url" => "https://api.github.com/repos/ga-students/godot_instructors/languages",
    "stargazers_url" => "https://api.github.com/repos/ga-students/godot_instructors/stargazers",
    "contributors_url" => "https://api.github.com/repos/ga-students/godot_instructors/contributors",
    "subscribers_url" => "https://api.github.com/repos/ga-students/godot_instructors/subscribers",
    "subscription_url" => "https://api.github.com/repos/ga-students/godot_instructors/subscription",
    "commits_url" => "https://api.github.com/repos/ga-students/godot_instructors/commits{/sha}",
    "git_commits_url" => "https://api.github.com/repos/ga-students/godot_instructors/git/commits{/sha}",
    "comments_url" => "https://api.github.com/repos/ga-students/godot_instructors/comments{/number}",
    "issue_comment_url" => "https://api.github.com/repos/ga-students/godot_instructors/issues/comments/{number}",
    "contents_url" => "https://api.github.com/repos/ga-students/godot_instructors/contents/{+path}",
    "compare_url" => "https://api.github.com/repos/ga-students/godot_instructors/compare/{base}...{head}",
    "merges_url" => "https://api.github.com/repos/ga-students/godot_instructors/merges",
    "archive_url" => "https://api.github.com/repos/ga-students/godot_instructors/{archive_format}{/ref}",
    "downloads_url" => "https://api.github.com/repos/ga-students/godot_instructors/downloads",
    "issues_url" => "https://api.github.com/repos/ga-students/godot_instructors/issues{/number}",
    "pulls_url" => "https://api.github.com/repos/ga-students/godot_instructors/pulls{/number}",
    "milestones_url" => "https://api.github.com/repos/ga-students/godot_instructors/milestones{/number}",
    "notifications_url" => "https://api.github.com/repos/ga-students/godot_instructors/notifications{?since,all,participating}",
    "labels_url" => "https://api.github.com/repos/ga-students/godot_instructors/labels{/name}",
    "releases_url" => "https://api.github.com/repos/ga-students/godot_instructors/releases{/id}",
    "created_at" => "2014-10-27T16:09:51Z",
    "updated_at" => "2014-10-27T16:09:51Z",
    "pushed_at" => "2014-10-27T18:25:07Z",
    "git_url" => "git://github.com/ga-students/godot_instructors.git",
    "ssh_url" => "git@github.com:ga-students/godot_instructors.git",
    "clone_url" => "https://github.com/ga-students/godot_instructors.git",
    "svn_url" => "https://github.com/ga-students/godot_instructors",
    "homepage" => nil,
    "size" => 0,
    "stargazers_count" => 0,
    "watchers_count" => 0,
    "language" => nil,
    "has_issues" => true,
    "has_downloads" => true,
    "has_wiki" => true,
    "has_pages" => false,
    "forks_count" => 0,
    "mirror_url" => nil,
    "open_issues_count" => 0,
    "forks" => 0,
    "open_issues" => 0,
    "watchers" => 0,
    "default_branch" => "master"
  },
  "sender" => {
    "login" => "phlco",
    "id" => 1198291,
    "avatar_url" => "https://avatars.githubusercontent.com/u/1198291?v=2",
    "gravatar_id" => "",
    "url" => "https://api.github.com/users/phlco",
    "html_url" => "https://github.com/phlco",
    "followers_url" => "https://api.github.com/users/phlco/followers",
    "following_url" => "https://api.github.com/users/phlco/following{/other_user}",
    "gists_url" => "https://api.github.com/users/phlco/gists{/gist_id}",
    "starred_url" => "https://api.github.com/users/phlco/starred{/owner}{/repo}",
    "subscriptions_url" => "https://api.github.com/users/phlco/subscriptions",
    "organizations_url" => "https://api.github.com/users/phlco/orgs",
    "repos_url" => "https://api.github.com/users/phlco/repos",
    "events_url" => "https://api.github.com/users/phlco/events{/privacy}",
    "received_events_url" => "https://api.github.com/users/phlco/received_events",
    "type" => "User",
    "site_admin" => false
  }
}

def hit
  url_string = "http://localhost:8080/postreceive"
  response = HTTParty.post(
      url_string,
      :body    => GITHUB_PAYLOAD.to_json,
      :headers => { 'Content-Type' => 'application/json' }
      )
  response
end
binding.pry
