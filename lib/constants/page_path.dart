class PagePath {
  /* Dashboard Left Navigation Bar */
  static const main = '/main';
  static const propertySelection = '/main/property';
  static const buildingSelection = '$propertySelection/building';
  static const applianceControl = '$buildingSelection/appliance';
  static const notification = '/main/notification';
  static const diagnostics = '/main/diagnostics';
  static const task = '/main/task';
  static const taskDetail = '$task/detail';
  static const reports = '/main/reports';
  static const financialReports = '$reports/financial';
  static const financialReportsResult = '$financialReports/result';
  static const usersAndRoles = '/main/users-and-roles';
  static const users = '$usersAndRoles/user';
  static const roles = '$usersAndRoles/roles';
  static const settings = '/main/settings';
  static const trainingLibrary = '/main/training-library';
  /* Settings */
  static const profile = '$settings/profile';
  static const notificationGroups = '$settings/notificationGroups';
  static const language = '$settings/language';
  static const general = '$settings/general';
  static const help = '$settings/help';
  static const about = '$settings/about';
  static const payment = '$settings/payment';
  static const pricing = '$settings/pricing';
  static const applianceSettings = '$settings/appliance-settings';
  static const subscription = '$settings/subscription';
  static const credits = '$settings/credits';
}
