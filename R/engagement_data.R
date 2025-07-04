#' Student Engagement Sequences Dataset
#'
#' A dataset containing sequential engagement patterns of 1000 students across 25 time points.
#' Students are classified into three engagement groups based on their overall engagement levels.
#' This dataset is ideal for demonstrating transition network analysis, sequential pattern mining,
#' and association rule learning with temporal educational data.
#'
#' @format A data frame with 1000 rows and 26 columns:
#' \describe{
#'   \item{Group}{Factor with 3 levels: "Low", "Moderate", "Engaged" - represents the student's overall engagement group}
#'   \item{T1-T25}{Character variables representing engagement level at each time point:
#'     \itemize{
#'       \item "Active" - Student is actively engaged
#'       \item "Average" - Student shows moderate engagement
#'       \item "Disengaged" - Student is not engaged
#'     }
#'   }
#' }
#'
#' @details
#' This dataset represents student engagement patterns collected over 25 consecutive time points.
#' Each row represents one student's engagement trajectory, and each time point (T1-T25) 
#' captures their engagement state at that moment.
#'
#' **Group Distribution:**
#' \itemize{
#'   \item Low: 260 students (26.0%)
#'   \item Moderate: 225 students (22.5%) 
#'   \item Engaged: 515 students (51.5%)
#' }
#'
#' **Engagement States:**
#' \itemize{
#'   \item Active: High engagement, active participation
#'   \item Average: Moderate engagement level
#'   \item Disengaged: Low engagement, passive or absent
#' }
#'
#' **Potential Analyses:**
#' \itemize{
#'   \item Sequential pattern analysis with \code{analyze_patterns()}
#'   \item Multi-group comparison with \code{compare_sequences_multi()}
#'   \item Association rule mining with \code{apriori_rules()} and \code{fp_growth_rules()}
#'   \item Sequence complexity analysis with \code{compute_sequence_indices()}
#'   \item Transition network analysis and temporal pattern detection
#' }
#'
#' @examples
#' # Load the dataset
#' data(engagement_data)
#' 
#' # Basic summary
#' summary(engagement_data)
#' table(engagement_data$Group)
#' 
#' # Check engagement distribution across time points
#' engagement_summary <- table(unlist(engagement_data[, 2:26]))
#' print(engagement_summary)
#' 
#' # Example: Multi-group pattern analysis
#' \dontrun{
#' library(tnaExtras)
#' 
#' # Analyze patterns across engagement groups
#' patterns <- analyze_patterns_multi(engagement_data, 
#'                                   group_col = "Group",
#'                                   min_length = 2, 
#'                                   max_length = 4)
#' print(patterns)
#' 
#' # Compare sequences between groups  
#' comparison <- compare_sequences_multi(engagement_data, "Group")
#' print(comparison)
#' 
#' # Association rule mining on engagement transitions
#' # Convert to transaction format for rule mining
#' engagement_transactions <- lapply(1:nrow(engagement_data), function(i) {
#'   as.character(engagement_data[i, 2:26])
#' })
#' 
#' # Mine frequent engagement patterns
#' rules <- apriori_rules(engagement_transactions, 
#'                       min_support = 0.1, 
#'                       min_confidence = 0.6)
#' print(rules)
#' 
#' # Visualize engagement pattern networks
#' plot_rules_network(rules, top_n = 20)
#' 
#' # Compute sequence complexity indices
#' indices <- compute_sequence_indices(engagement_data,
#'                                   group_col = "Group", 
#'                                   favorable_states = "Active",
#'                                   return_group_summary = TRUE)
#' print_indices_summary(indices)
#' }
#'
#' @source Simulated student engagement data for educational research and 
#'   demonstration of temporal pattern analysis techniques.
#'
#' @keywords datasets education engagement sequential temporal
"engagement_data" 