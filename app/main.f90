program main
  use github_org_analyzer, only:  analyze_github_organization, get_top_active_repositories, &
  get_top_starred_repositories, get_most_used_repositories, get_contributor_from_repositories
  
  implicit none

  print *, '::::::: All Repositories :::::::'//new_line('a')
  call analyze_github_organization(org_name='fortran-lang')

  print *, '::::::: Top Active Repositories :::::::'//new_line('a')
  call get_top_active_repositories(org_name='fortran-lang')

  print *, '::::::: Top Starred Repositories :::::::'//new_line('a')
  call get_top_starred_repositories(org_name='fortran-lang')

  print *, '::::::: Top Used Repositories :::::::'//new_line('a')
  call get_most_used_repositories(org_name='fortran-lang')

  print *, '::::::: Contributors from a Repositories :::::::'//new_line('a')
  call get_contributor_from_repositories(org_name='fortran-lang', repo_name='stdlib')



end program main
