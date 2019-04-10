#!/bin/bash
#ARG_POSITIONAL_SINGLE([scenario_home],[The directory of scenario])
#ARG_POSITIONAL_INF([scenarios],[The scenarios to be run])
#ARG_OPTIONAL_SINGLE([target_dir],[o],[The target directory of output],["testcases"])
#ARG_OPTIONAL_SINGLE([agent_dir],[],[The directory of agent],["workspace/agent"])
#ARG_OPTIONAL_SINGLE([agent_with_optional_dir],[],[The directory of agent that it contain the optional plugins],["workspace/agent-with-optional-plugins"])
#ARG_OPTIONAL_SINGLE([collector_image_version],[],[The image version of collector],["6.0.0-2018"])
#ARG_OPTIONAL_SINGLE([skip_single_mode],[],[Skip build the scenario with single mode],[on])
#ARG_OPTIONAL_BOOLEAN([skip_build],[],[Skip build the scenario project],[on])
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
	local first_option all_short_options='oh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_scenarios=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_target_dir="testcases"
_arg_agent_dir="workspace/agent"
_arg_agent_with_optional_dir="workspace/agent-with-optional-plugins"
_arg_collector_image_version="6.0.0-2018"
_arg_skip_single_mode="on"
_arg_skip_build="on"


print_help()
{
	printf 'Usage: %s [-o|--target_dir <arg>] [--agent_dir <arg>] [--agent_with_optional_dir <arg>] [--collector_image_version <arg>] [--skip_single_mode <arg>] [--(no-)skip_build] [-h|--help] <scenario_home> [<scenarios-1>] ... [<scenarios-n>] ...\n' "$0"
	printf '\t%s\n' "<scenario_home>: The directory of scenario"
	printf '\t%s\n' "<scenarios>: The scenarios to be run"
	printf '\t%s\n' "-o, --target_dir: The target directory of output (default: '"testcases"')"
	printf '\t%s\n' "--agent_dir: The directory of agent (default: '"workspace/agent"')"
	printf '\t%s\n' "--agent_with_optional_dir: The directory of agent that it contain the optional plugins (default: '"workspace/agent-with-optional-plugins"')"
	printf '\t%s\n' "--collector_image_version: The image version of collector (default: '"6.0.0-2018"')"
	printf '\t%s\n' "--skip_single_mode: Skip build the scenario with single mode (default: 'on')"
	printf '\t%s\n' "--skip_build, --no-skip_build: Skip build the scenario project (on by default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-o|--target_dir)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_target_dir="$2"
				shift
				;;
			--target_dir=*)
				_arg_target_dir="${_key##--target_dir=}"
				;;
			-o*)
				_arg_target_dir="${_key##-o}"
				;;
			--agent_dir)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_agent_dir="$2"
				shift
				;;
			--agent_dir=*)
				_arg_agent_dir="${_key##--agent_dir=}"
				;;
			--agent_with_optional_dir)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_agent_with_optional_dir="$2"
				shift
				;;
			--agent_with_optional_dir=*)
				_arg_agent_with_optional_dir="${_key##--agent_with_optional_dir=}"
				;;
			--collector_image_version)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_collector_image_version="$2"
				shift
				;;
			--collector_image_version=*)
				_arg_collector_image_version="${_key##--collector_image_version=}"
				;;
			--skip_single_mode)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_skip_single_mode="$2"
				shift
				;;
			--skip_single_mode=*)
				_arg_skip_single_mode="${_key##--skip_single_mode=}"
				;;
			--no-skip_build|--skip_build)
				_arg_skip_build="on"
				test "${1:0:5}" = "--no-" && _arg_skip_build="off"
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
	local _required_args_string="'scenario_home'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require at least 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_scenario_home "
	_our_args=$((${#_positionals[@]} - 1))
	for ((ii = 0; ii < _our_args; ii++))
	do
		_positional_names="$_positional_names _arg_scenarios[$((ii + 0))]"
	done

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

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
#

# declare functions
parse_yaml() {
    local yaml_file=$1
    local s
    local w
    local fs

    s='[[:space:]]*'
    w='[a-zA-Z0-9_.-]*'
    fs="$(echo @|tr @ '\034')"

    (
        sed -ne '/^--/s|--||g; s|\"|\\\"|g; s/\s*$//g;' \
            -e "/#.*[\"\']/!s| #.*||g; /^#/s|#.*||g;" \
            -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
            -e "s|^\($s\)\($w\)$s[:-]$s\(.*\)$s\$|\1$fs\2$fs\3|p" |

        awk -F"$fs" '{
            indent = length($1)/2;
            if (length($2) == 0) { conj[indent]="+";} else {conj[indent]="";}
            vname[indent] = $2;
            for (i in vname) {if (i > indent) {delete vname[i]}}
                if (length($3) > 0) {
                    vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
                    printf("%s%s%s=(\"%s\")\n", vn, $2, conj[indent-1],$3);
                }
            }' |

        sed -e 's/_=/+=/g' \
            -e '/\..*=/s|\.|_|' \
            -e '/\-.*=/s|\-|_|'

    ) < "$yaml_file"
}

cleanEnvVariables(){
	testcase_support_versions=()
    testcase_running_mode=""
    testcase_test_framework=""
    testcase_request_url=""
}

#declare variables
SCENARIOS_HOME=`cd ${_arg_scenario_home} >/dev/null; pwd`
CASES_HOME=`cd ${_arg_target_dir} >/dev/null; pwd`
AGENT_DIR=`cd ${_arg_agent_dir} >/dev/null; pwd`
AGENT_WITH_OPTIONAL_PLUGINS_DIR=`cd ${_arg_agent_with_optional_dir}`
COLLECTOR_IMAGE_VERSION=${_arg_collector_image_version}
ESCAPE_AGENT_DIR=$(echo "$AGENT_DIR" |sed -e 's/\//\\\//g' )
ESCAPE_AGENT_WITH_OPTIONAL_PLUGINS_DIR=$(echo "$AGENT_WITH_OPTIONAL_PLUGINS_DIR" |sed -e 's/\//\\\//g' )

#
rm -rf ${CASES_HOME} && mkdir -p ${CASES_HOME}

for SCENARIO in ${_arg_scenarios}
do
    SCENARIO_HOME=${SCENARIOS_HOME}/${SCENARIO}
    SCENARIO_CONFIG_FILE=${SCENARIO_HOME}/testcase.yml
    echo "[INFO] start to deploy ${SCENARIO_HOME}"

    eval "$(parse_yaml "$SCENARIO_CONFIG_FILE")"
    SUPPORT_VERSIONS=${testcase_support_versions[@]}
    TEST_FRAMEWORK=${testcase_test_framework}
    TEST_CASE_REQUEST_URL=${testcase_request_url}
    RUNNING_MODE=${testcase_running_mode}

    # skip the running mode is SINGLE
    if [ "$RUNNING_MODE" = "SINGLE" ] && [ "${_arg_skip_single_mode}" = "on" ] ; then
        echo "[WARNING] ${SCENARIO} running mode: ${RUNNING_MODE}. skip this project"
        cleanEnvVariables
        continue
    fi

    AGENT_FILE_PATH="${ESCAPE_AGENT_DIR}"
    if [ "$RUNNING_MODE" = "WITH_OPTIONAL" ]; then
        AGENT_FILE_PATH="${ESCAPE_AGENT_WITH_OPTIONAL_PLUGINS_DIR}"
    fi

    cd ${SCENARIO_HOME}
	for SUPPORT_VERSION in ${SUPPORT_VERSIONS[@]}
	do
    if [ "${_arg_skip_build}" = "on" ]; then
      echo "[INFO] execute mvn package docker:build -P${SCENARIO}-${SUPPORT_VERSION}"
      mvn clean package docker:build -P${SCENARIO}-${SUPPORT_VERSION}
    else
      echo "[INFO] skip build the case ${SCENARIO} - ${SUPPORT_VERSION}"
    fi

	  TEST_CASE_DIR=$CASES_HOME/$SCENARIO-$SUPPORT_VERSION && mkdir -p $TEST_CASE_DIR

		cp $SCENARIO_HOME/config/expectedData.yaml $TEST_CASE_DIR
		cp $SCENARIO_HOME/config/docker-compose.yml $TEST_CASE_DIR
		eval sed -i '' -e 's/\{CASES_IMAGE_VERSION\}/$SUPPORT_VERSION/' $TEST_CASE_DIR/docker-compose.yml
		eval sed -i '' -e 's/\{COLLECTOR_IMAGE_VERSION\}/$COLLECTOR_IMAGE_VERSION/' $TEST_CASE_DIR/docker-compose.yml
    eval sed -i -e 's/\{AGENT_FILE_PATH\}/$AGENT_FILE_PATH/' $TEST_CASE_DIR/docker-compose.yml
		touch $TEST_CASE_DIR/testcase.desc
		echo "case.testFramework=$TEST_FRAMEWORK" >> $TEST_CASE_DIR/testcase.desc
		echo "case.testComponents=$SUPPORT_VERSION" >> $TEST_CASE_DIR/testcase.desc
		echo "case.request_url=$TEST_CASE_REQUEST_URL" >> $TEST_CASE_DIR/testcase.desc
		echo "case.projectName=${TESTCASE_PROJECT}" >> $TEST_CASE_DIR/testcase.desc
		cleanEnvVariables
    echo "[INFO] build $SCENARIO:$SUPPORT_VERSION success."
	done
done



#
# ] <-- needed because of Argbash
