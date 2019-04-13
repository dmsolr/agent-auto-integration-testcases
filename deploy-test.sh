#!/bin/bash
#
#ARG_POSITIONAL_SINGLE([agent_repo],[The agent repository URL to be run])
#ARG_POSITIONAL_SINGLE([agent_repo_branch],[The branch name of agent repository to be run])
#ARG_POSITIONAL_SINGLE([testcase_repo],[The testcase repository URL to be run])
#ARG_POSITIONAL_SINGLE([testcase_repo_branch],[The branch name of testcase repository to be run])
#ARG_OPTIONAL_REPEATED([scenario],[],[The scenarios to be run])
#ARG_OPTIONAL_SINGLE([issue_no],[],[The relate issue no],[UNKNOWN])
#ARG_OPTIONAL_BOOLEAN([build],[],[Skip build projects.])
#ARG_OPTIONAL_BOOLEAN([report],[],[Skip report the testcase to GitHub. off])
#ARG_OPTIONAL_BOOLEAN([clone_code],[],[Skip clone the code],[off])
#ARG_OPTIONAL_BOOLEAN([skip_single_mode_scenario],[],[Skip build the scenario with single mode],[on])
#ARG_OPTIONAL_SINGLE([collector_image_version],[],[The docker image version of mock collector],["6.0.0-2018"])
#ARG_OPTIONAL_SINGLE([parallel_run_size],[],[The size of running testcase at the same time],[1])
#ARG_OPTIONAL_SINGLE([validate_log_url_prefix],[],[The url prefix of validate log url],[http://host:port/jenkins])
#DEFINE_SCRIPT_DIR([AGENT_TEST_HOME])
#ARG_HELP([])
#ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.7.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info


die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}


begins_with_short_option()
{
	local first_option all_short_options='h'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_scenario=()
_arg_issue_no="UNKNOWN"
_arg_build="off"
_arg_report="off"
_arg_clone_code="off"
_arg_skip_single_mode_scenario="on"
_arg_collector_image_version="6.0.0-2018"
_arg_parallel_run_size="1"
_arg_validate_log_url_prefix="http://host:port/jenkins"


print_help()
{
	printf 'Usage: %s [--scenario <arg>] [--issue_no <arg>] [--(no-)build] [--(no-)report] [--(no-)clone_code] [--(no-)skip_single_mode_scenario] [--collector_image_version <arg>] [--parallel_run_size <arg>] [--validate_log_url_prefix <arg>] [-h|--help] <agent_repo> <agent_repo_branch> <testcase_repo> <testcase_repo_branch>\n' "$0"
	printf '\t%s\n' "<agent_repo>: The agent repository URL to be run"
	printf '\t%s\n' "<agent_repo_branch>: The branch name of agent repository to be run"
	printf '\t%s\n' "<testcase_repo>: The testcase repository URL to be run"
	printf '\t%s\n' "<testcase_repo_branch>: The branch name of testcase repository to be run"
	printf '\t%s\n' "--scenario: The scenarios to be run (empty by default)"
	printf '\t%s\n' "--issue_no: The relate issue no (default: 'UNKNOWN')"
	printf '\t%s\n' "--build, --no-build: Skip build projects. (off by default)"
	printf '\t%s\n' "--report, --no-report: Skip report the testcase to GitHub. off (off by default)"
	printf '\t%s\n' "--clone_code, --no-clone_code: Skip clone the code (off by default)"
	printf '\t%s\n' "--skip_single_mode_scenario, --no-skip_single_mode_scenario: Skip build the scenario with single mode (on by default)"
	printf '\t%s\n' "--collector_image_version: The docker image version of mock collector (default: '"6.0.0-2018"')"
	printf '\t%s\n' "--parallel_run_size: The size of running testcase at the same time (default: '1')"
	printf '\t%s\n' "--validate_log_url_prefix: The url prefix of validate log url (default: 'http://host:port/jenkins')"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			--scenario)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_scenario+=("$2")
				shift
				;;
			--scenario=*)
				_arg_scenario+=("${_key##--scenario=}")
				;;
			--issue_no)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_issue_no="$2"
				shift
				;;
			--issue_no=*)
				_arg_issue_no="${_key##--issue_no=}"
				;;
			--no-build|--build)
				_arg_build="on"
				test "${1:0:5}" = "--no-" && _arg_build="off"
				;;
			--no-report|--report)
				_arg_report="on"
				test "${1:0:5}" = "--no-" && _arg_report="off"
				;;
			--no-clone_code|--clone_code)
				_arg_clone_code="on"
				test "${1:0:5}" = "--no-" && _arg_clone_code="off"
				;;
			--no-skip_single_mode_scenario|--skip_single_mode_scenario)
				_arg_skip_single_mode_scenario="on"
				test "${1:0:5}" = "--no-" && _arg_skip_single_mode_scenario="off"
				;;
			--collector_image_version)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_collector_image_version="$2"
				shift
				;;
			--collector_image_version=*)
				_arg_collector_image_version="${_key##--collector_image_version=}"
				;;
			--parallel_run_size)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_parallel_run_size="$2"
				shift
				;;
			--parallel_run_size=*)
				_arg_parallel_run_size="${_key##--parallel_run_size=}"
				;;
			--validate_log_url_prefix)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_validate_log_url_prefix="$2"
				shift
				;;
			--validate_log_url_prefix=*)
				_arg_validate_log_url_prefix="${_key##--validate_log_url_prefix=}"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'agent_repo', 'agent_repo_branch', 'testcase_repo' and 'testcase_repo_branch'"
	test "${_positionals_count}" -ge 4 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 4 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 4 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 4 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_agent_repo _arg_agent_repo_branch _arg_testcase_repo _arg_testcase_repo_branch "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash
AGENT_TEST_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" || die "Couldn't determine the script's running directory, which probably matters, bailing out" 2

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
#

# declare variables
WORKSPACE=${AGENT_TEST_HOME}/workspace
SOURCE_CODE_DIR=${WORKSPACE}/source
AGENT_SOURCE_CODE=${SOURCE_CODE_DIR}/skywalking
VALIDATE_TOOL_SOURCE_CODE=${SOURCE_CODE_DIR}/validate-tool
AGENT_WITH_OPTIONAL_PLUGIN_DIR=${SOURCE_CODE_DIR}/agent-with-optional-plugins
REPORT_HOME=${WORKSPACE}/report
AGENT_DIR=${SOURCE_CODE_DIR}/agent
TESTCASES_HOME=${AGENT_TEST_HOME}/testcases
VALIDATE_TOOL_REPO=https://github.com/SkywalkingTest/agent-integration-testtool.git
VALIDATE_TOOL_REPO_BRANCH=master
OVERWRITE_README="on"
LOGS_DIR=${WORKSPACE}/logs

declare -a SCENARIOS
if [ ${#_arg_scenario[@]} -eq 0 ]; then
    for SCENARIO in `ls $AGENT_TEST_HOME`
    do
        if [ -f "${SCENARIO}/testcase.yml" ]; then
            SCENARIOS+=("${SCENARIO}")
        fi
    done
else
    SCENARIOS=("${_arg_scenario[@]}")
    OVERWRITE_README="off"
fi

echo "[INFO] Running parameteres:"
echo -e "  - Agent repository:\t\t${_arg_agent_repo}"
echo -e "  - Agent repository branch:\t${_arg_agent_repo_branch}"
echo -e "  - Testcase repository:\t${_arg_testcase_repo}"
echo -e "  - Testcase repository branch:\t${_arg_testcase_repo_branch}"
echo -e "  - Issue No:\t\t\t${_arg_issue_no}"
echo -e "  - Build:\t\t\t${_arg_build}"
echo -e "  - Report:\t\t\t${_arg_report}"
echo -e "  - Image version of collector:\t${_arg_collector_image_version}"
echo -e "  - parallel running number:\t${_arg_parallel_run_size}"
echo -e "  - Scenarios:\t\t\t${SCENARIOS[@]}"

# build workspace
if [ "${_arg_clone_code}" = "on" ]; then
    rm -rf ${WORKSPACE} && mkdir -p ${WORKSPACE}
fi

rm -rf ${LOGS_DIR} && mkdir -p ${LOGS_DIR}

echo "[INFO] build workspace"
${AGENT_TEST_HOME}/.autotest/build_agent.sh --build ${_arg_build} ${_arg_agent_repo} ${_arg_agent_repo_branch} ${AGENT_SOURCE_CODE} >${LOGS_DIR}/agent-build.log && ${AGENT_TEST_HOME}/.autotest/build_validate_tool.sh --build ${_arg_build} ${VALIDATE_TOOL_REPO} ${VALIDATE_TOOL_REPO_BRANCH} ${VALIDATE_TOOL_SOURCE_CODE} && ${AGENT_TEST_HOME}/.autotest/build_report.sh ${REPORT_HOME}

AGENT_COMMIT_ID=$(cd $AGENT_SOURCE_CODE && git rev-parse HEAD)
TESTCASE_COMMIT_ID=$(cd $AGENT_TEST_HOME && git rev-parse HEAD)

# build testcase
echo "[INFO] build test case projects"
${AGENT_TEST_HOME}/build_testcases.sh --collector_image_version ${_arg_collector_image_version} --skip_single_mode ${_arg_skip_single_mode_scenario} . ${SCENARIOS} > ${LOGS_DIR}/testcase-build.log

# run test_case
${AGENT_TEST_HOME}/run.sh ${TESTCASES_HOME} >/dev/null

# generate report
${AGENT_TEST_HOME}/.autotest/generate-report.sh --agent_repo ${_arg_agent_repo} --agent_branch ${_arg_agent_repo_branch} --testcase_repo ${_arg_testcase_repo} --testcase_branch ${_arg_testcase_repo_branch} --agent_commitid ${AGENT_COMMIT_ID} --testcase_commitid ${TESTCASE_COMMIT_ID} --overwrite_readme ${OVERWRITE_README} --upload_report ${_arg_report} --issue_no ${_arg_issue_no} --validate_log_url_prefix ${_arg_validate_log_url_prefix} ${TESTCASES_HOME} ${REPORT_HOME} > ${LOGS_DIR}/validate.log

#
# ] <-- needed because of Argbash
