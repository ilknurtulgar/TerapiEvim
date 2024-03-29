enum LocalManagerKeys {
  userId, // String
  role, // String
  name, // String
  aboutMe, // String
  birthDate, // String
  gender, // String
  email, // String
  phone, // String
  imageUrl, // String
  isTermsOfUseAccepted, // bool

  /// Participant
  pSessionId,
  pJoinedGroupId, // String
  pGroupCategory, // String
  pIsJoinedGroupLocked, // bool
  pIsTestResultReady, // bool
  pIsScl90Submitted, // bool
  pIsSessionComplete, // bool
  pIsSessionSelected, // bool
  ///Therapist
  isTherapistConfirmed, // bool
  isTherapistBeingReviewed, // bool
  isBeingAdvisorAccepted, // bool
  isDiplomaUploaded, // bool
  maxNumberOfGroups, // int
  isTDiplomaUploaded, // bool
}
