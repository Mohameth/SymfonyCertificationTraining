<?php


namespace App\Controller;


use App\Entity\Category;
use App\Entity\Conference;
use App\Entity\Question;
use App\Repository\CategoryRepository;
use App\Repository\CommentRepository;
use App\Repository\ConferenceRepository;
use App\Repository\QuestionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;

class CategoryController extends AbstractController
{

    /**
     * TODO: On Category page add progression, button random questions
     * TODO:
     */

    /**
     * @Route("/categories", name="categories")
     */
    public function showCategories(Environment $twig, CategoryRepository $categoryRepository): Response
    {
        return new Response($twig->render('Category/categories.html.twig', [
            'categories' => $categoryRepository->findAll(),
        ]));
    }

    /**
     * @Route("/category/{id}", name="category")
     */
    public function showCategory(Environment $twig, Category $category, QuestionRepository $questionRepository): Response
    {
        return new Response($twig->render('Category/Question/questions.html.twig', [
            'category'  => $category,
            'questions' => $questionRepository->findAll(), //By(['category' => $category])
        ]));
    }

    /**
     * @Route("/category/{categoryId}/question/{questionId}", name="question")
     *
     * @ParamConverter("category", options={"mapping": {"categoryId": "id"}})
     * @ParamConverter("question", options={"mapping": {"questionId": "id"}})
     */
    public function showQuestion(Environment $twig, Category $category, Question $question): Response
    {
        return new Response($twig->render('Category/Question/question.html.twig', [
            'category' => $category,
            'question' => $question,
        ]));
    }
}
