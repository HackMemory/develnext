<?php
namespace ide\formats\form\elements;

use ide\formats\form\AbstractFormElement;
use php\gui\designer\UXDesignProperties;
use php\gui\designer\UXDesignPropertyEditor;
use php\gui\layout\UXHBox;
use php\gui\UXButton;
use php\gui\UXNode;
use php\gui\UXTableCell;
use php\gui\UXTextField;

/**
 * Class ButtonFormElement
 * @package ide\formats\form
 */
class ButtonFormElement extends AbstractFormElement
{
    public function getName()
    {
        return 'Кнопка';
    }

    public function getIcon()
    {
        return 'icons/button16.png';
    }

    /**
     * @return UXNode
     */
    public function createElement()
    {
        $button = new UXButton($this->getName());
        return $button;
    }

    public function getDefaultSize()
    {
        return [150, 35];
    }

    /**
     * @param UXDesignProperties $properties
     */
    public function createProperties(UXDesignProperties $properties)
    {
        $properties->addGroup('general', 'Главное');
        $properties->addProperty('general', 'text', 'Текст', new TextPropertyEditor());
        $properties->addProperty('general', 'x', 'Позиция X', new TextPropertyEditor());
    }

    public function isOrigin($any)
    {
        return $any instanceof UXButton;
    }
}

class TextPropertyEditor extends UXDesignPropertyEditor
{
    /**
     * @var UXTextField
     */
    protected $textField;

    /**
     * @var UXButton
     */
    protected $dialogButton;

    /**
     * @var UXNode
     */
    protected $content;

    /**
     * @var callable
     */
    protected $getter;

    /**
     * @var callable
     */
    protected $setter;

    /**
     * TextPropertyEditor constructor.
     *
     * @param callable $getter
     * @param callable $setter
     */
    public function __construct(callable $getter = null, callable $setter = null)
    {
        $this->textField = new UXTextField();
        $this->textField->padding = 2;
        $this->textField->style = "-fx-background-insets: 0; -fx-background-color: -fx-control-inner-background; -fx-background-radius: 0;";

        $this->dialogButton = new UXButton();
        $this->dialogButton->text = '...';
        $this->dialogButton->padding = [1, 4];
        $this->dialogButton->style = '-fx-cursor: hand;';
        $this->dialogButton->width = 20;

        $this->content = new UXHBox([$this->textField, $this->dialogButton]);

        $this->textField->on('keyUp', function () {
            if (!$this->setter) {
                $this->designProperties->target->{$this->code} = $this->textField->text;
            } else {
                $setter = $this->setter;
                $setter($this, $this->textField->text);
            }
        });
    }


    /**
     * @param UXTableCell $cell
     * @param bool $empty
     *
     * @return mixed
     */
    public function update(UXTableCell $cell, $empty)
    {
        $cell->graphic = $this->content;

        if (!$this->getter) {
            $value = $this->designProperties->target->{$this->code};
            $this->textField->text = $value;
        } else {
            $getter = $this->getter;
            $this->textField->text = $getter($this);
        }
    }
}