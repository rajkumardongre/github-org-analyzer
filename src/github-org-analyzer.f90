module github_org_analyzer
  use json_module, only : json_file
  use http, only : request, response_type
  use utils, only : int_to_str

  implicit none
  private

  public :: analyze_github_organization
  public :: get_top_active_repositories
  public :: get_top_starred_repositories
  public :: get_most_used_repositories
  public :: get_contributor_from_repositories
  
  contains

  subroutine analyze_github_organization(org_name)
    character(*), intent(in) :: org_name
    character(:), allocatable :: api_url

    api_url = 'https://api.github.com/orgs/'//org_name//'/repos'
    call print_org_repositories(api_url)
  end subroutine

  subroutine get_top_active_repositories(org_name, count)
    character(*), intent(in) :: org_name
    character(:), allocatable :: api_url, count_str
    integer, optional, intent(in) :: count

    if(present(count)) then
      count_str = int_to_str(count)
    else
      count_str = '5'
    end if

    api_url = 'https://api.github.com/orgs/'//org_name//'/repos?sort=updated&direction=desc&per_page='//count_str
    call print_org_repositories(api_url)
  end subroutine get_top_active_repositories

  subroutine get_top_starred_repositories(org_name, count)
    character(*), intent(in) :: org_name
    character(:), allocatable :: api_url, count_str
    integer, optional, intent(in) :: count

    if(present(count)) then
      count_str = int_to_str(count)
    else
      count_str = '5'
    end if

    api_url = 'https://api.github.com/orgs/'//org_name//'/repos?sort=stars&direction=desc&per_page='//count_str
    call print_org_repositories(api_url)
  end subroutine get_top_starred_repositories

  subroutine get_most_used_repositories(org_name, count)
    character(*), intent(in) :: org_name
    character(:), allocatable :: api_url, count_str
    integer, optional, intent(in) :: count

    if(present(count)) then
      count_str = int_to_str(count)
    else
      count_str = '5'
    end if

    api_url = 'https://api.github.com/orgs/'//org_name//'/repos?sort=forks&direction=desc&per_page='//count_str
    call print_org_repositories(api_url)
  end subroutine get_most_used_repositories

  subroutine get_contributor_from_repositories(org_name, repo_name, count)
    character(*), intent(in) :: org_name, repo_name
    character(:), allocatable :: api_url, count_str
    integer, optional, intent(in) :: count

    if(present(count)) then
      count_str = int_to_str(count)
    else
      count_str = '5'
    end if

    api_url = 'https://api.github.com/repos/'//org_name//'/'//repo_name//'/contributors?per_page='//count_str
    call print_contributors(api_url)
  end subroutine get_contributor_from_repositories

  subroutine print_org_repositories(api_url)
    character(*), intent(in) :: api_url
    character(:), allocatable :: count, value
    type(json_file) :: json
    type(response_type) :: response
    integer :: i
    logical :: found

    response = request(url=api_url)
    
    call json%initialize()
    call json%deserialize(response%content)
    
    i = 1
    count = int_to_str(i)
    call json%get('['//count//'].name', value, found)
    do while(found)
      call json%get('['//count//'].name', value, found); if(found) print*, 'Repository Name: ',value
      call json%get('['//count//'].description', value, found); if(found) print*, 'Description    : ',value
      call json%get('['//count//'].language', value, found); if(found) print*, 'Language       : ',value
      call json%get('['//count//'].stargazers_count', value, found); if(found) print*, 'Stars          : ',value
      call json%get('['//count//'].forks_count', value, found); if(found) print*, 'Forks          : ',value
      call json%get('['//count//'].open_issues_count', value, found); if(found) print*, 'Open Issues    : ',value
      call json%get('['//count//'].html_url', value, found); if(found) print*, 'URL            : ',value
      print *, ''

      i = i+1
      count = int_to_str(i)
      call json%get('['//count//'].name', value, found)
    end do

  end subroutine print_org_repositories

  subroutine print_contributors(api_url)
    character(*), intent(in) :: api_url
    character(:), allocatable :: count, value
    type(json_file) :: json
    type(response_type) :: response
    integer :: i
    logical :: found

    response = request(url=api_url)
    
    call json%initialize()
    call json%deserialize(response%content)
    
    i = 1
    count = int_to_str(i)
    call json%get('['//count//'].login', value, found)
    do while(found)
      call json%get('['//count//'].login', value, found); if(found) print*, 'User Name        : ',value
      call json%get('['//count//'].contributions', value, found); if(found) print*, 'Contributions    : ',value
      call json%get('['//count//'].html_url', value, found); if(found) print*, 'URL              : ',value
      print *, ''


      i = i+1
      count = int_to_str(i)
      call json%get('['//count//'].login', value, found)
    end do

  end subroutine print_contributors


end module github_org_analyzer
