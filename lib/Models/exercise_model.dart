class ExerciseModel {
  final String imageName;
  final String exercisesTitle;
  final String exercisesNumber;
  final Function()? onTap;

  ExerciseModel({
    required this.imageName,
    required this.exercisesTitle,
    required this.exercisesNumber,
    this.onTap,
  });
}
